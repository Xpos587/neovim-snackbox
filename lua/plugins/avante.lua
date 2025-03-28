return {
  {
    "yetone/avante.nvim",
    event = "BufEnter",
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = function()
      return {
        behaviour = {
          auto_suggestions = true,
          enable_claude_text_editor_tool_mode = true,
          enable_cursor_planning_mode = true, -- enable cursor planning mode!
        },

        -- Используем get_chat_provider для установки приоритета провайдеров
        provider = require("avante-status").get_chat_provider({
          "copilot",
          "claude",
          "openai",
        }),
        auto_suggestions_provider = require("avante-status").get_suggestions_provider({
          "copilot",
          "claude",
          "openai",
        }),

        cursor_applying_provider = "groq",

        rag_service = {
          enabled = true, -- Enables the RAG service
          host_mount = os.getenv("HOME"), -- Host mount path for the rag service
          provider = "openai", -- The provider to use for RAG service (e.g. openai or ollama)
          llm_model = "gpt-4o-mini", -- The LLM model to use for RAG service
          embed_model = "text-embedding-3-large", -- The embedding model to use for RAG service
          endpoint = "https://api.openai.com/v1", -- The API endpoint for embedding model
        },

        web_search_engine = {
          provider = "tavily", -- tavily, serpapi, searchapi, google or kagi
        },

        -- https://docs.github.com/en/copilot/using-github-copilot/ai-models/changing-the-ai-model-for-copilot-chat
        copilot = {
          endpoint = "https://api.githubcopilot.com",
          proxy = "http://127.0.0.1:2081",
          model = "gpt-4o-2024-08-06",
        },

        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o-mini", -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- timeout in milliseconds
          temperature = 0, -- adjust if needed
          max_tokens = 4096,
          -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
        },

        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-3-5-sonnet-20241022",
          timeout = 30000, -- Timeout in milliseconds
          temperature = 0,
          max_tokens = 4096,
          disable_tools = true, -- disable tools!
        },

        vendors = {
          groq = {
            __inherited_from = "openai",
            api_key_name = "GROQ_API_KEY",
            endpoint = "https://api.groq.com/openai/v1/",
            model = "llama-3.3-70b-versatile",
            max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
          },

          openrouter = {
            __inherited_from = "openai",
            endpoint = "https://openrouter.ai/api/v1",
            api_key_name = "OPENROUTER_API_KEY",
            model = "deepseek/deepseek-r1",
          },

          perplexity = {
            __inherited_from = "openai",
            api_key_name = "PERPLEXITY_API_KEY",
            endpoint = "https://api.perplexity.ai",
            model = "llama-3.1-sonar-large-128k-online",
          },

          deepseek = {
            __inherited_from = "openai",
            api_key_name = "DEEPSEEK_API_KEY",
            endpoint = "https://api.deepseek.com",
            model = "deepseek-coder",
          },
        },

        windows = {
          postion = "right",
          width = 30,
          sidebar_header = {
            enabled = true,
            align = "center",
            rounded = true,
          },
          input = {
            prefix = " ",
            height = 12, -- Height of the input window in vertical layout
          },
        },

        file_selector = {
          provider = "telescope",
        },

        mappings = {
          diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
          },
          suggestion = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
          jump = {
            next = "]]",
            prev = "[[",
          },
          submit = {
            normal = "<CR>",
            insert = "<C-s>",
          },
          sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            retry_user_request = "r",
            edit_user_request = "e",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
            remove_file = "d",
            add_file = "@",
            close = { "<Esc>", "q" },
            close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
          },
        },
      }
    end,
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
