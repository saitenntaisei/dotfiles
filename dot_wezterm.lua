local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
  end

  -- カラースキームの設定
  config.color_scheme = 'AdventureTime'

  -- フォントの設定
  config.font = wezterm.font("NotoMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})
  -- フォントサイズの設定
  config.font_size = 13
  config.macos_window_background_blur = 20
  config.background = {
    -- This is the deepest/back-most layer. It will be rendered first
    {
      source = {
        File = '/Users/saitenntaisei/Pictures/miko.jpg',
      },
      -- The texture tiles vertically but not horizontally.
      -- When we repeat it, mirror it so that it appears "more seamless".
      -- An alternative to this is to set `width = "100%"` and have
      -- it stretch across the display
      repeat_x = 'NoRepeat',
      vertical_align = 'Middle',
      horizontal_align = 'Center',
      opacity = 0.90,
      hsb = {
        -- 背景画像の明るさ
        -- 1.0で元画像から変更なし
        brightness = 0.05,
        -- 色相の設定
        -- 1.0で元画像から変更なし
        hue = 1.0,
        -- 彩度の調整
        -- 1.0で元画像から変更なし
        saturation = 1.0,
      },
      -- When the viewport scrolls, move this layer 10% of the number of
      -- pixels moved by the main viewport. This makes it appear to be
      -- further behind the text.
      attachment = { Parallax = 0.1 },
    }
  }


  -- キーバインドの設定
  local act = wezterm.action
  config.keys = {
    {
      key = 'd',
      mods = 'SHIFT|ALT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'd',
      mods = 'ALT',
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
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  }

  config.window_close_confirmation = 'NeverPrompt'

  return config

