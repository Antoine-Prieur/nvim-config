local config = require("lspconfig.configs")

local on_attach = config.on_attach
local capabilities = config.capabilities
local tf_capb = vim.lsp.protocol.make_client_capabilities()
tf_capb.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local util = require('lspconfig/util')

local path = util.path

-- Utils --

local function get_python_path(workspace)
  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end

  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

-- Setup --

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  before_init = function(_, config_arg)
    config_arg.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
  settings = {
  python = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
      }
    }
  }
})

