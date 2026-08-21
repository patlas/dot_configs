-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Nawigacja po buforach (Tab i Shift+Tab)
vim.keymap.set("n", "<Tab>", ":bn<CR>", { desc = "Następny bufor" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "Poprzedni bufor" })

-- Ctrl+b przełącza na ostatnio używany bufor (odpowiednik :b#)
vim.keymap.set("n", "<C-b>", ":b#<CR>", { desc = "Ostatnio aktywny bufor" })

-- Leader + q zamyka bieżący bufor (usuwa go z pamięci za pomocą :bwipeout)
vim.keymap.set("n", "<leader>q", ":bw<CR>", { desc = "Zamknij bieżący bufor" })
-- vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Zamknij okno" }) -- Zakomentowane zgodnie z oryginałem
--
-- Leader + m skacze do pasującej pary nawiasów (zastępuje znak %)
vim.keymap.set("n", "<leader>m", "%", { desc = "Skocz do pasującej pary" })
vim.keymap.set("v", "<leader>m", "%", { desc = "Skocz do pasującej pary" })

-- Alt+l: Przejście na koniec linii
vim.keymap.set("i", "<M-l>", "<ESC>$a", { desc = "Idź na koniec linii" })
vim.keymap.set("n", "<M-l>", "$", { desc = "Idź na koniec linii" })

-- Alt+h: Przejście na początek linii
vim.keymap.set("i", "<M-h>", "<ESC>^i", { desc = "Idź na początek linii" })
vim.keymap.set("n", "<M-h>", "^", { desc = "Idź na początek linii" })

-- Alt+Enter: Nowa linia poniżej w trybie Insert
vim.keymap.set("i", "<M-CR>", "<ESC>$o", { silent = true, desc = "Nowa linia poniżej" })

-- Ctrl+p: Wklejanie
vim.keymap.set("i", "<C-p>", "<ESC>pa", { silent = true, desc = "Wklej tekst" })
vim.keymap.set("n", "<C-p>", ":pu<CR>", { silent = true, desc = "Wklej tekst poniżej" })

-- Komentowanie pojedynczej linii w trybie Normal za pomocą <leader>c
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, desc = "Komentuj linię" })

-- Komentowanie zaznaczonego bloku w trybie Visual za pomocą <leader>c
vim.keymap.set("v", "<leader>c", "gc", { remap = true, desc = "Komentuj zaznaczenie" })

-- Terminale na dole ekranu
-- Leader+t: Otwiera terminal i kopiuje ścieżkę bieżącego pliku do schowka systemowego (+)
vim.keymap.set("n", "<leader>t", function()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
    vim.cmd("belowright split term://bash")
    vim.cmd("startinsert")
end, { silent = true, desc = "Terminal na dole (kopiuj ścieżkę)" })

-- Shift+t: Otwiera terminal bezpośrednio w katalogu bieżącego pliku
vim.keymap.set(
    "n",
    "<S-t>",
    ":belowright split term://bash -c 'cd %:p:h; exec bash'<CR>i",
    { silent = true, desc = "Terminal w katalogu pliku" }
)

-- Wcięcia w trybie Visual (z zachowaniem zaznaczenia)
vim.keymap.set("x", "<Tab>", ">gv", { desc = "Zwiększ wcięcie zaznaczenia" })
vim.keymap.set("x", "<S-Tab>", "<gv", { desc = "Zmniejsz wcięcie zaznaczenia" })

-- Leader+hh: Podświetla wszystkie wystąpienia słowa pod kursorem (używa grupy IncSearch)
vim.keymap.set("n", "<leader>hh", function()
    local cword = vim.fn.expand("<cword>")
    vim.cmd(string.format("match IncSearch /\\<%s\\>/", cword))
end, { silent = true, desc = "Podświetl słowo pod kursorem" })



-- <Shift-f> Grep word under cursor
-- <Ctrl-f> Grep interface
local ok, snacks = pcall(require, "snacks")
if ok then
    -- F (Shift + f) -> Wyszukiwanie słowa pod kursorem (Normal) lub zaznaczenia (Visual)
    vim.keymap.set({ "n", "x" }, "F", function()
        snacks.picker.grep_word()
    end, { desc = "Snacks Picker: Word / Selection" })

    -- Ctrl + f -> Live Grep w całym projekcie
    vim.keymap.set({ "n", "x" }, "<C-f>", function()
        snacks.picker.grep()
    end, { desc = "Snacks Picker: Live Grep" })
end


-- VimWS custom support
if ok then
    vim.keymap.set({ "n", "x" }, "<C-f>", function()
        -- Pobieramy ścieżkę do potencjalnego pliku konfiguracyjnego w projekcie
        local ws_file = vim.fn.getcwd() .. "/.vimws.lua"

        -- Domyślne wartości, gdyby pliku .vimws.lua nie było
        local search_dirs = { vim.fn.getcwd() }
        local exclude_globs = {}

        -- Sprawdzamy czy plik istnieje i czy da się go odczytać
        if vim.fn.filereadable(ws_file) == 1 then
            -- Bezpiecznie ładujemy plik konfiguracyjny projektu za pomocą chunków Lua
            local config_func, err = loadfile(ws_file)
            if config_func then
                local ws_config = config_func()
                if type(ws_config) == "table" then
                    -- Przypisujemy sparsowane ścieżki i filtry wykluczeń
                    search_dirs = ws_config.projws or search_dirs
                    exclude_globs = ws_config.skip or exclude_globs
                end
            else
                vim.notify("Błąd ładowania .vimws.lua: " .. tostring(err), vim.log.levels.ERROR)
            end
        end

        if snacks.config and snacks.config.picker then
            snacks.config.picker.previewers = snacks.config.picker.previewers or {}
            snacks.config.picker.previewers.file = snacks.config.picker.previewers.file or {}
            snacks.config.picker.previewers.file.max_size = 20 * 1024 * 1024
            -- Wszystko powyżej 1MB wyłączy kolorowanie aby przyspieszyć wyświetlanie
            snacks.config.picker.previewers.file.ft_max_size = 1024 * 1024
        end

        -- Najpierw pytamy użytkownika o słowo do wyszukania (prompt).
        -- Po jego podaniu uruchamiamy grep jednorazowo (live = false),
        -- dzięki czemu pole wyszukiwania w pickerze służy do dalszego
        -- fuzzowego filtrowania wyników — analogicznie jak Shift+F.
        vim.ui.input({ prompt = "Project Grep    " }, function(search_term)
            if not search_term or vim.trim(search_term) == "" then
                return -- anulowano lub puste zapytanie — nie otwieraj pickera
            end

            -- Wywołujemy picker Snacks z dynamicznymi argumentami z pliku projektu
            snacks.picker.grep({
                prompt = "Filter Results    ",
                live = false,             -- input filtruje wyniki, nie uruchamia grep ponownie
                search = search_term,     -- wzorzec grep uruchamiany jeden raz
                dirs = search_dirs,       -- Szuka wyłącznie w tych katalogach
                exclude = exclude_globs,  -- Ignoruje pliki i foldery z listy skip
                previewers = {
                    file = {
                        max_size = 10 * 1024 * 1024,
                    },
                },
            })
        end)
    end, { desc = "Snacks Picker: Workspace Grep (.vimws.lua)" })
end
