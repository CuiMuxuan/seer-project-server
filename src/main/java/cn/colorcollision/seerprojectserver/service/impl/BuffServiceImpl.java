package cn.colorcollision.seerprojectserver.service.impl;


import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.Buff;
import cn.colorcollision.seerprojectserver.service.BuffService;
import cn.colorcollision.seerprojectserver.mapper.BuffMapper;
import org.springframework.stereotype.Service;

/**
* @author 爻
* @description 针对表【buff】的数据库操作Service实现
* @createDate 2023-09-16 13:59:26
*/
@Service
public class BuffServiceImpl extends ServiceImpl<BuffMapper, Buff>
    implements BuffService{

}




