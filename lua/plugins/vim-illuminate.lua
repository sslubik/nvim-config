return {
	"RRethy/vim-illuminate",

    config = function()
        local illuminate = require("illuminate")
        illuminate.configure()
        
        vim.keymap.set(
            "n", "]", function() illuminate.goto_next_reference(false) end
        )
        vim.keymap.set(
            "n", "[", function() illuminate.goto_prev_reference(false) end
        )
    end,
}
