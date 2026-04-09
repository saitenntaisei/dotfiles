local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
  end

  -- カラースキームの設定
  config.color_scheme = 'AdventureTime'
  config.hide_mouse_cursor_when_typing = false
  -- フォントの設定
  config.font = wezterm.font("NotoMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})
  -- フォントサイズの設定
  config.font_size = 13
  config.background = {
    -- This is the deepest/back-most layer. It will be rendered first
    {
      source = {
        File = '/home/saiten/Pictures/miko.png',
      },
      -- The texture tiles vertically but not horizontally.
      -- When we repeat it, mirror it so that it appears "more seamless".
      -- An alternative to this is to set `width = "100%"` and have
      -- it stretch across the display
      repeat_x = 'NoRepeat',
      vertical_align = 'Middle',
      horizontal_align = 'Center',
      opacity = 0.95,
      hsb = {
        -- 背景画像の明るさ
        -- 1.0で元画像から変更なし
        brightness = 0.01,
        -- 色相の設定
        -- 1.0で元画像から変更なし
        hue = 1.0,
        -- 彩度の調整
        -- 1.0で元画像から変更なし
        saturation = 1.0,
      },
      attachment = "Fixed",
    }
  }


  -- キーバインドの設定
  local act = wezterm.action

  config.keys = {
    {
      key = '=',
      mods = 'CTRL|ALT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '-',
      mods = 'CTRL|ALT',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Ctrl+左矢印でカーソルを前の単語に移動
    {
      key = "LeftArrow",
      mods = "CTRL",
      action = act.SendKey {
        key = "b",
        mods = "META",
      },
    },
    -- Ctrl+右矢印でカーソルを次の単語に移動
    {
      key = "RightArrow",
      mods = "CTRL",
      action = act.SendKey {
        key = "f",
        mods = "META",
      },
    },
    -- Ctrl+Backspaceで前の単語を削除
    {
      key = "Backspace",
      mods = "CTRL",
      action = act.SendKey {
        key = "w",
        mods = "CTRL",
      },
    },
    -- kill a pane
    {
      key = 'x',
      mods = 'CTRL',
      action = act.CloseCurrentPane { confirm = true },
    },
    -- { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
    {
      key = 'h',
      mods = 'ALT',
      action = act.AdjustPaneSize { 'Left', 5 },
    },
    {
      key = 'j',
      mods = 'ALT',
      action = act.AdjustPaneSize { 'Down', 5 },
    },
    { key = 'k',
      mods = 'ALT',
      action = act.AdjustPaneSize { 'Up', 5 },
    },
    {
      key = 'l',
      mods = 'ALT',
      action = act.AdjustPaneSize { 'Right', 5 },
    },
     
     { key = 'x', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
  }

  config.window_close_confirmation = 'NeverPrompt'

  return config

