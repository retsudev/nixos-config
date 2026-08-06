{ pkgs, ... }:

{
  home.packages = with pkgs; [
    quickshell
    kdePackages.qtdeclarative
    cmake
    ninja
    pkg-config
  ];

  home.sessionVariables = {
    QML_IMPORT_PATH = "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml:${pkgs.quickshell}/lib/qt-6/qml";
    QMLLS_BUILD_DIRS = "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml:${pkgs.quickshell}/lib/qt-6/qml";
  };
}
