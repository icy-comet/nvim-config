local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
    end,

    static = {

        mode_names = {
            n = "N",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "V",
            vs = "Vs",
            V = "V_",
            Vs = "Vs",
            ["\22"] = "^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
        },

        mode_colors = {
            n = "blue" ,
            i = "green",
            v = "yellow",
            V =  "yellow",
            ["\22"] =  "sapphire",
            c =  "orange",
            s =  "lavender",
            S =  "lavender",
            ["\19"] =  "lavender",
            R =  "orange",
            r =  "orange",
            ["!"] =  "blue",
            t =  "blue",
        }
    },

    provider = function(self)
        return "   "..self.mode_names[self.mode].." "
    end,

    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = "base", bg = self.mode_colors[mode], bold = true, }
    end,

    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd("redrawstatus")
        end),
    },
}

local FileFormat = {
    provider = function()
        local fmt = vim.bo.fileformat
        return fmt:upper()
    end,

    hl = function()
        return { fg = "teal" }
    end
}

-- We're getting minimalists here!
local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%7(%l/%3L%):%2c %P",
    hl = {fg = "lavender"}
}

-- I take no credits for this! :lion:
local ScrollBar ={
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
        -- Another variant, because the more choice the better.
        -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = { fg = "blue", bg = "surface1" },
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = "rosewater" },

    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = "green" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = "red" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = "peach" },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}

local HelpFileName = {
    condition = function()
        return vim.bo.filetype == "help"
    end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
    end,
    hl = { fg = "blue" },
}


local TerminalName = {
    -- we could add a condition to check that buftype == 'terminal'
    condition = function()
        conditions.buffer_matches({buftype={"terminal"}})
    end,
    -- or we could do that later (see #conditional-statuslines below)
    provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return " " .. tname
    end,
    hl = { fg = "blue", bold = true },
}

local Diagnostics = {

    condition = conditions.has_diagnostics,

    static = {
        error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },

    {
        provider = "![",
    },
    {
        provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = "DiagnosticSignError",
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = "DiagnosticSignWarn",
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = "DiagnosticSignInfo",
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = "DiagnosticSignHint",
    },
    {
        provider = "]",
    },
}

local Fill = { provider = "%=" }
local Space = {provider = " "}

local ActiveStatusLine = {
    hl = function(self)
        if(conditions.is_active()) then
            return {bg = "surface0"}
        end
        return {fg = "surface1", bg = "surface0", force = true}
    end,

    ViMode,
    HelpFileName,
    TerminalName,
    Space,
    Git,
    Fill,
    Diagnostics,
    Space,
    Ruler,
    Space,
    ScrollBar,
    Space,
    FileFormat
}

local StatusLines = {
    condition = function()
        if(conditions.buffer_matches({buftype={"nofile"}})) then
            return nil
        end
        return true
    end,

    ActiveStatusLine
}

return StatusLines
