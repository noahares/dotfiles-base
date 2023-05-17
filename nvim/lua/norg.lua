require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/Seafile/neorg",
        },
      }
    },
    ["core.concealer"] = {},
    -- ["core.gtd.base"] = {
    --   config = {
    --     workspace = "notes",
    --     default_lists = {
    --       inbox = "inbox.norg",
    --     }
    --   }
    -- },
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = ','
      }
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.integrations.telescope"] = {},
    ["core.esupports.metagen"] = {
      config = {
        type = "auto",
    }
  },
  ["core.export"] = {}
  }
}
