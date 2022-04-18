require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          uni = "~/norg-test/uni",
          private = "~/norg-test/private",
        }
      }
    },
    ["core.norg.concealer"] = {},
    ["core.gtd.base"] = {
      config = {
        workspace = "private",
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
