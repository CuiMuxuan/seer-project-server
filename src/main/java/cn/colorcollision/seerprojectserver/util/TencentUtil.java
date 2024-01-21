package cn.colorcollision.seerprojectserver.util;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;

import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.common.profile.ClientProfile;
import com.tencentcloudapi.common.profile.HttpProfile;
import com.tencentcloudapi.ocr.v20181119.OcrClient;
import com.tencentcloudapi.ocr.v20181119.models.GeneralAccurateOCRRequest;
import com.tencentcloudapi.ocr.v20181119.models.GeneralAccurateOCRResponse;
import com.tencentcloudapi.ocr.v20181119.models.TextDetection;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

import static cn.colorcollision.seerprojectserver.custom.Constant.SERCRET_ID;
import static cn.colorcollision.seerprojectserver.custom.Constant.SERCRET_KEY;


/**
 * @author 爻
 * @date 2023/8/6
 * @design
 */
@Slf4j
public class TencentUtil {
    // 实例化一个认证对象，入参需要传入腾讯云账户 SecretId 和 SecretKey，此处还需注意密钥对的保密
    // 代码泄露可能会导致 SecretId 和 SecretKey 泄露，并威胁账号下所有资源的安全性。以下代码示例仅供参考，建议采用更安全的方式来使用密钥，请参见：https://cloud.tencent.com/document/product/1278/85305
    // 密钥可前往官网控制台 https://console.cloud.tencent.com/cam/capi 进行获取
    public static List<TextDetection> generalAccurate(String base64) {
        try {
            Credential cred = new Credential(SERCRET_ID, SERCRET_KEY);
            // 实例化一个http选项，可选的，没有特殊需求可以跳过
            HttpProfile httpProfile = new HttpProfile();
            httpProfile.setEndpoint("ocr.tencentcloudapi.com");
            // 实例化一个client选项，可选的，没有特殊需求可以跳过
            ClientProfile clientProfile = new ClientProfile();
            clientProfile.setHttpProfile(httpProfile);
            // 实例化要请求产品的client对象,clientProfile是可选的
            OcrClient client = new OcrClient(cred, "ap-shanghai", clientProfile);
            // 实例化一个请求对象,每个接口都会对应一个request对象
            GeneralAccurateOCRRequest req = new GeneralAccurateOCRRequest();
            req.setImageBase64(base64);
            // 返回的resp是一个GeneralAccurateOCRResponse的实例，与请求对象对应
            GeneralAccurateOCRResponse resp = client.GeneralAccurateOCR(req);
            // 输出json格式的字符串回包
//            System.out.println(GeneralAccurateOCRResponse.toJsonString(resp));
            JSONArray jsonArray = JSONObject.parseObject(GeneralAccurateOCRResponse.toJsonString(resp)).getJSONArray("TextDetections");
            return jsonArray.toJavaList(TextDetection.class);
        } catch (TencentCloudSDKException e) {
            System.out.println(e.toString());
        }
        return null;
    }
}
