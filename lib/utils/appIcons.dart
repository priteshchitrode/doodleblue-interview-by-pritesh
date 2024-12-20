@override
class AppIcons {
  AppIcons._();
  static PngIcons png = PngIcons();
  static SvgIcons svg = SvgIcons();
}

/// PNG Icons
class PngIcons {
  static const String _pngBasePath = "assets/icons/png/";
}

/// SVG Icons
class SvgIcons {
  static const String _svgBasePath = "assets/icons/svg/";
  final String add = "${_svgBasePath}addBold.svg";
  final String addOutline = "${_svgBasePath}addOutline.svg";
  final String delete = "${_svgBasePath}delete.svg";
  final String edit = "${_svgBasePath}editBold.svg";
  final String back = "${_svgBasePath}back.svg";

}
