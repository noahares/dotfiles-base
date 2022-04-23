require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          uni = "~/Seafile/neorg/uni",
          private = "~/Seafile/neorg/private",
          default = "~/Seafile/neorg",
        }
      }
    },
    ["core.norg.concealer"] = {},
    ["core.gtd.base"] = {
      config = {
        workspace = "default",
        default_lists = {
          inbox = "inbox.norg",
        }
      }
    },
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = ','
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.integrations.telescope"] = {},
    ["core.norg.esupports.metagen"] = {
      config = {
        type = "auto",
    }
  }
  }
}
