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

  stylix.targets.fcitx5.enable = true;
}

