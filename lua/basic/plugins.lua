local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    -- 中文文档
    { "yianwillis/vimcdoc" },

    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("conf.nvim-web-devicons")
        end
    },

    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- 依赖一个图标插件
        config = function()
            -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
            require("conf.nvim-tree")
        end
    },

    {
        "vim-zui",
        dir = "/home/tintin/vim-zui",
        config = function()
            vim.cmd([[
                autocmd BufRead,BufNewFile *.php setlocal completefunc=zui#complete
                autocmd BufRead,BufNewFile *.php setlocal completeopt=menu,menuone,preview,noinsert
                autocmd BufRead,BufNewFile *.php inoremap <C-f> <C-x><C-u>
                autocmd CompleteDone * pclose
            ]])

            vim.o.splitbelow = true
        end
    },

    {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("conf.catppuccin")
        end
    },

    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("conf.nvim-web-devicons")
        end
    },

    -- 模糊查找
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep",    -- 文字查找
            "sharkdp/fd"             -- 文件查找
        },
        config = function()
            require("conf.telescope")
        end
    },

    -- 内置终端
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("conf.toggleterm")
        end
    },

    -- 支持 LSP 状态的 buffer 栏
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "famiu/bufdelete.nvim", 'nvim-tree/nvim-web-devicons' }, -- 删除 buffer 时不影响现有布局
        config = function()
            require("conf.bufferline")
        end
    },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function()
            require("conf.mason")
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("conf.mason-lspconfig")
        end
    },

    -- LSP 基础服务
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("conf.nvim-lspconfig")
        end
    },

    -- 插入模式获得函数签名
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("conf.lsp_signature")
        end
    },

    {
        "codota/tabnine-nvim",
        build = "./dl_binaries.sh",
        config = function()
            require("conf.tabnine")
        end
    },

    -- 自动代码补全系列插件
    {
        "hrsh7th/nvim-cmp",                           -- 代码补全核心插件，下面都是增强补全的体验插件
        dependencies = {
            { "onsails/lspkind-nvim" },               -- 为补全添加类似 vscode 的图标
            { "hrsh7th/vim-vsnip" },                  -- vsnip 引擎，用于获得代码片段支持
            -- {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
            { "hrsh7th/cmp-nvim-lsp" },               -- 替换内置 omnifunc，获得更多补全
            { "hrsh7th/cmp-path" },                   -- 路径补全
            { "hrsh7th/cmp-buffer" },                 -- 缓冲区补全
            { "hrsh7th/cmp-cmdline" },                -- 命令补全
            { "f3fora/cmp-spell" },                   -- 拼写建议
            -- {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
            { "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
        },
        config = function()
            require("conf.nvim-cmp")
        end
    },

    -- 自动保存
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("conf.auto-save")
        end
    },

    -- 搜索时显示条目
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("conf.nvim-hlslens")
        end
    },

    -- 自动匹配括号
    {
        "windwp/nvim-autopairs",
        config = function()
            require("conf.nvim-autopairs")
        end
    },

    -- 自动恢复光标位置
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("conf.nvim-lastplace")
        end
    },

    -- 灯泡提示代码行为
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("conf.nvim-lightbulb")
        end
    },

    -- 代码注释
    {
        "numToStr/Comment.nvim",
        config = function()
            require("conf.Comment")
        end
    },

    -- 自动会话管理
    {
        "rmagatti/auto-session",
        config = function()
            require("conf.auto-session")
        end
    },

    -- view tree
    {
        "liuchengxu/vista.vim",
        config = function()
            require("conf.vista")
        end
    },

    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("conf.diffview")
        end
    },

    { "APZelos/blamer.nvim" },

    -- 键位绑定器
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        opts = {}
    }
})
