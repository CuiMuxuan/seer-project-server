package cn.colorcollision.seerprojectserver.util;

import com.mybatisflex.core.paginate.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 爻
 * @date 2023/8/6
 * @design
 */
@Slf4j
public class PropertyUtil {

    /**
     * DTO 转换为DO 工具类
     *
     * @param dtoEntity DTO对象
     * @param doClass   DO类
     * @return DO对象
     */
    public static <DO> DO dtoToDo(Object dtoEntity, Class<DO> doClass) {
        // 判断DTO是否为空!
        if (dtoEntity == null) {
            return null;
        }
        // 判断doClass 是否为空
        if (doClass == null) {
            return null;
        }
        try {
            DO newInstance = doClass.getDeclaredConstructor().newInstance();
            BeanUtils.copyProperties(dtoEntity, newInstance);
            // DTO转换DO
            return newInstance;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * DO 转换为DTO 工具类
     *
     * @param doEntity DO对象
     * @param dtoClass DTO类
     * @return DTO对象
     */
    public static <DTO> DTO doToDto(Object doEntity, Class<DTO> dtoClass) {
        // 判断DO是否为空!
        if (doEntity == null) {
            return null;
        }
        // 判断dtoClass 是否为空
        if (dtoClass == null) {
            return null;
        }
        try {
            DTO newInstance = dtoClass.getDeclaredConstructor().newInstance();
            BeanUtils.copyProperties(doEntity, newInstance);
            // DO转换 DTO
            return newInstance;
        } catch (Exception e) {
            log.error("DO转换DTO异常", e);
            return null;
        }
    }

    public static <S, D> List<D> listToList(List<S> sourceList, Class<D> destinationClass) {
        return sourceList.stream().map(source -> {
            D destination;
            try {
                destination = destinationClass.getDeclaredConstructor().newInstance();
                BeanUtils.copyProperties(source, destination);
            } catch (Exception e) {
                log.error("list转换异常", e);
                return null;
            }
            return destination;
        }).collect(Collectors.toList());
    }
    public static <S,D> Page<D> pageToPage(Page<S> sourcePage,Class<D> destinationClass){
        List<S> sourceList=sourcePage.getRecords();
        List<D> destinationList=listToList(sourceList,destinationClass);
        Page<D> destination=new Page<>();
        BeanUtils.copyProperties(sourcePage, destination);
        destination.setRecords(destinationList);
        return destination;
    }
}
