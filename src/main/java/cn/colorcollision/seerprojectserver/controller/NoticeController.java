package cn.colorcollision.seerprojectserver.controller;

import cn.colorcollision.seerprojectserver.POJO.DO.Notice;
import cn.colorcollision.seerprojectserver.custom.ResultVO;
import cn.colorcollision.seerprojectserver.service.NoticeService;
import cn.xuyanwu.spring.file.storage.FileInfo;
import cn.xuyanwu.spring.file.storage.FileStorageService;
import com.mybatisflex.core.query.QueryWrapper;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;
import java.util.Objects;

import static cn.colorcollision.seerprojectserver.custom.Constant.AUTH;

/**
 * @author 爻
 * @date 2023/8/9
 * @design
 */
@Tag(name = "公告控制器")
@Slf4j
@RestController
@RequestMapping("/notice")
public class NoticeController {
    @Resource
    NoticeService noticeService;
    @Resource
    private FileStorageService fileStorageService;
    @PostMapping("/auth")
    public ResultVO<?> auth(@RequestBody String auth){
        return Objects.equals(auth, AUTH)?ResultVO.success(true): ResultVO.success(false);
    }
    @PostMapping("/uploadImage")
    public String uploadImage(MultipartFile file) {
        FileInfo fileInfo = fileStorageService.of(file).upload();
        log.info("上传文件成功，文件信息：{}", fileInfo);
        return fileInfo == null ? "上传失败！" : fileInfo.getUrl();
    }
    @PostMapping("/upload")
    @CacheEvict(cacheNames = {"notice"}, allEntries = true)
    public ResultVO<?> upload(@RequestBody String content){
        Notice notice=new Notice();
        notice.setCreateTime(new Date());
        notice.setContent(HtmlUtils.htmlEscapeHex(content));
        return noticeService.save(notice)?ResultVO.success("发布成功"):ResultVO.error("发布失败");
    }
    @GetMapping("/show")
    @Cacheable(cacheNames = "notice")
    public ResultVO<?> show(){
        return ResultVO.success(noticeService.list(new QueryWrapper().select("id").orderBy("create_time DESC")));
    }
    @GetMapping("/getById")
    @Cacheable(cacheNames = "notice")
    public ResultVO<?> getById(@RequestParam("id") Long id){
        Notice notice=noticeService.getById(id);
        if(notice.getContent()!=null){
            notice.setContent(HtmlUtils.htmlUnescape(notice.getContent()));
        }
        return ResultVO.success(notice);
    }
}
