import 'package:dio/dio.dart';
import 'package:bot_toast/bot_toast.dart';

/// 使用 Uint8List 数据类型
import 'dart:typed_data';

/// 授权管理
import 'package:permission_handler/permission_handler.dart';

/// 保存文件或图片到本地
import 'package:image_gallery_saver/image_gallery_saver.dart';

class AppUtil {
  /// 保存图片到相册
  ///
  /// 默认为下载网络图片，如需下载资源图片，需要指定 [isAsset] 为 `true`。
  static Future<void> saveImage(String imageUrl, {bool isAsset: false}) async {
    try {
      if (imageUrl == null) throw '保存失败，图片不存在！';

      /// 权限检测
      PermissionStatus storageStatus = await Permission.storage.status;
      if (storageStatus != PermissionStatus.granted) {
        storageStatus = await Permission.storage.request();
        if (storageStatus != PermissionStatus.granted) {
          throw '无法存储图片，请先授权！';
        }
      }

      /// 保存的图片数据
      Uint8List imageBytes;
      if (isAsset == true) {
        /// 保存资源图片
        // ByteData bytes = await rootBundle.load(imageUrl);
        // imageBytes = bytes.buffer.asUint8List();
      } else {
        var response = await Dio()
            .get(imageUrl, options: Options(responseType: ResponseType.bytes));
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.data));
        print('result:$result');
        if (result == null || result == '') {
          BotToast.showSimpleNotification(title: '保存失败');
        } else {
          BotToast.showSimpleNotification(title: '保存成功');
        }
      }
    } catch (e) {
      BotToast.showSimpleNotification(title: e.toString());
    }
  }
}
