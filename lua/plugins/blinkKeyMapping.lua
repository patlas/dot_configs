return {
    {
        "saghen/blink.cmp",
        opts = {
            keymap = {
                preset = "none", -- Wyłączamy domyślne mapowania, aby uniknąć konfliktów

                -- Tab zatwierdza podświetloną podpowiedź
                ["<Tab>"] = { "select_and_accept", "fallback" },

                -- Ctrl + j idzie w dół listy podpowiedzi
                ["<C-j>"] = { "select_next", "fallback" },

                -- Ctrl + k idzie w górę listy podpowiedzi
                ["<C-k>"] = { "select_prev", "fallback" },

                -- Dodatkowe przydatne domyślne skróty (opcjonalnie)
                ["<C-space>"] = { "show", "hide", "fallback" }, -- Otwieranie/zamykanie menu
                ["<C-e>"] = { "hide", "fallback" },             -- Ukrycie menu
            },
        },
    },
}
