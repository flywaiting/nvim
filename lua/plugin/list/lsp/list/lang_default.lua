
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- for ufo
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

return {
	capabilities = capabilities,
}
