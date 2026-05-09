return {
    {
        'vyfor/cord.nvim',

        config = function()
            require("cord").setup({
                editor = {
                    client = 'neovim',
                    tooltip = 'He gits on my branch until I commit',
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
