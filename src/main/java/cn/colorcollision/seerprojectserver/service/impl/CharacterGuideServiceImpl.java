package cn.colorcollision.seerprojectserver.service.impl;


import org.springframework.stereotype.Service;
import cn.colorcollision.seerprojectserver.service.CharacterGuideService;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterGuide;
import cn.colorcollision.seerprojectserver.mapper.CharacterGuideMapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;

/**
 * 服务层实现。
 *
 * @author Cui Muxuan
 * @since 1.0
 */
@Service
public class CharacterGuideServiceImpl extends ServiceImpl<CharacterGuideMapper, CharacterGuide> implements CharacterGuideService {

}