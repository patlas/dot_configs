return {
  {
    "saghen/blink.cmp",
    opts = {
      -- 1. Globalna konfiguracja listy (dla trybu Insert)
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },

      -- 2. Tryb Wiersza Poleceń i Wyszukiwania (Rozróżnienie między / a :)
      cmdline = {
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = false,
            },
          },
          menu = {
            auto_show = true, -- Okienko podpowiedzi wyskakuje samo
          },
        },

        keymap = {
          preset = "none", -- Wyłączamy domyślne mapowania, aby zapobiec konfliktom

          -- Tab przechodzi w dół TYLKO podczas wyszukiwania (/)
          ["<Tab>"] = {
            function(cmp)
              if vim.fn.getcmdtype() == "/" or vim.fn.getcmdtype() == "?" or vim.fn.getcmdtype() == ":" then
                return cmp.select_next() 
              end
            end,
            "fallback", -- Dla komendy ':' (oraz gdy menu jest zamknięte) użyj domyślnego zachowania Vima
          },

          -- Shift + Tab przechodzi w górę TYLKO podczas wyszukiwania (/)
          ["<S-Tab>"] = {
            function(cmp)
              if vim.fn.getcmdtype() == "/" or vim.fn.getcmdtype() == "?" or vim.fn.getcmdtype() == ":" then
                return cmp.select_prev() 
              end
            end,
            "fallback",
          },

          -- !!! POPRAWIONY ENTER !!!
          -- Wykorzystuje wbudowaną w blink.cmp akcję "accept_and_enter"
          ["<CR>"] = {
            function(cmp)
              if (vim.fn.getcmdtype() == "/" or vim.fn.getcmdtype() == "?") and cmp.is_visible() then
                return cmp.accept_and_enter() -- Akceptuje słowo i bezbłędnie uruchamia wyszukiwanie
              end
            end,
            "fallback", -- Dla trybu ':' (oraz gdy menu jest zamknięte) zadziała standardowy Enter edytora
          },
          ["<C-space>"] = { "show", "hide", "fallback" },
        },
      },

      -- 3. Główne mapowania dla trybu Insert (pisanie kodu)
      keymap = {
        preset = "none",
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-space>"] = { "show", "hide", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
      },
    },
  },
}
