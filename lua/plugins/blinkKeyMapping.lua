-- return {
--     {
--         "saghen/blink.cmp",
--         opts = {
--             -- 1. Globalna konfiguracja listy (dla trybu Insert)
--             completion = {
--                 list = {
--                     selection = {
--                         preselect = false,
--                         auto_insert = false,
--                     },
--                 },
--             },
--
--             -- 2. Tryb Wiersza Poleceń i Szukania (Cmdline: / oraz :)
--             cmdline = {
--                 -- !!! KLUCZOWA POPRAWKA !!!
--                 -- Wymuszamy wyłączenie automatycznego wyboru i wklejania bezpośrednio dla trybu cmdline
--                 completion = {
--                     list = {
--                         selection = {
--                             preselect = false,
--                             auto_insert = false,
--                         },
--                     },
--                     menu = {
--                         auto_show = true, -- Zmusza okienko do automatycznego pojawiania się pod `/`
--                     },
--                 },
--
--                 keymap = {
--                     preset = "none", -- Wyłączamy domyślne mapowania, aby uniknąć konfliktów
--
--                     -- Tab przechodzi do KOLEJNEJ podpowiedzi na liście (w dół)
--                     ["<Tab>"] = { "select_next", "fallback" },
--
--                     -- Shift + Tab przechodzi do POPRZEDNIEJ podpowiedzi (w górę)
--                     ["<S-Tab>"] = { "select_prev", "fallback" },
--
--                     -- Enter (CR) ZATWIERDZA podświetloną podpowiedź
--                     ["<CR>"] = { "select_and_accept", "fallback" },
--                     ["<C-space>"] = { "show", "hide", "fallback" }, -- Otwieranie/zamykanie menu
--                 },
--             },
--
--             -- 3. Główne mapowania dla trybu Insert (pisanie kodu)
--             keymap = {
--                 preset = "none", -- Wyłączamy domyślne mapowania, aby uniknąć konfliktów
--
--                 -- Tab zatwierdza podświetloną podpowiedź
--                 ["<Tab>"] = { "select_and_accept", "fallback" },
--
--                 -- Ctrl + j idzie w dół listy podpowiedzi
--                 ["<C-j>"] = { "select_next", "fallback" },
--
--                 -- Ctrl + k idzie w górę listy podpowiedzi
--                 ["<C-k>"] = { "select_prev", "fallback" },
--
--                 -- Dodatkowe przydatne domyślne skróty
--                 ["<C-space>"] = { "show", "hide", "fallback" }, -- Otwieranie/zamykanie menu
--                 ["<C-e>"] = { "hide", "fallback" },             -- Ukrycie menu
--             },
--         },
--     },
-- }


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
              if vim.fn.getcmdtype() == "/" or vim.fn.getcmdtype() == "?" then
                return cmp.select_next() 
              end
            end,
            "fallback", -- Dla komendy ':' (oraz gdy menu jest zamknięte) użyj domyślnego zachowania Vima
          },

          -- Shift + Tab przechodzi w górę TYLKO podczas wyszukiwania (/)
          ["<S-Tab>"] = {
            function(cmp)
              if vim.fn.getcmdtype() == "/" or vim.fn.getcmdtype() == "?" then
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
