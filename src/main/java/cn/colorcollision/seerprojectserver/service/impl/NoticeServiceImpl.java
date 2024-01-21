package cn.colorcollision.seerprojectserver.service.impl;


import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.Notice;
import cn.colorcollision.seerprojectserver.service.NoticeService;
import cn.colorcollision.seerprojectserver.mapper.NoticeMapper;
import org.springframework.stereotype.Service;

/**
* @author 爻
* @description 针对表【notice】的数据库操作Service实现
* @createDate 2023-08-09 15:11:46
*/
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice>
    implements NoticeService{

}




