return {
    {
        'vyfor/cord.nvim',

        config = function()
            require("cord").setup({
                editor = {
                    client = 'neovim',
                    tooltip = 'Apagnan sur Skibidi',
                    icon = nil,
                },

                display = {
                    theme = 'atom',
                    flavor = 'accent',
                    view = 'full',
                    swap_fields = false,
                    swap_icons = false,
                },
            })
        end,
    }

}
