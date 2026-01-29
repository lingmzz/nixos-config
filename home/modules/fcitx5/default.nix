{ config, pkgs, inputs, ... }:
{
  # 选择输入法类型为 fcitx5
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
  };

  # 添加常用中文模块
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-rime
    qt6Packages.fcitx5-configtool
    qt6Packages.fcitx5-chinese-addons  # 拼音、五笔等
  ];

  # 设置rime输入法与美式键盘英文输入法并排序rime第一位
  i18n.inputMethod.fcitx5.settings.inputMethod = {
    GroupOrder."0" = "Default";
    "Groups/0" = {
      Name = "Default";
      "Default Layout" = "us";
      DefaultIM = "keyboard-us";
    };
    "Groups/0/Items/0".Name = "keyboard-us";
    "Groups/0/Items/1".Name = "rime";
  };

  xdg.dataFile."fcitx5/rime/luna_pinyin_simp.custom.yaml".text = ''
    patch:
      # 关键：配置 Enter 键提交原始输入
      key_binder:
        bindings:
         # 方式1：标准格式（推荐）
          - when: composing
            accept: Return      # 或 Return/Enter/KP_Enter
            commit_raw_input: true

          # 方式2：单行格式（等效）
          # - { when: composing, accept: Return, commit_raw_input: true }

          # 可选：Escape 清除输入
          - when: composing
            accept: Escape
            send: Clear

          # 可选：Shift+Enter 提交原始输入（另一种习惯）
          - when: composing
            accept: "Shift+Return"
            commit_raw_input: true
  '';

  stylix.targets.fcitx5.enable = true;
}

