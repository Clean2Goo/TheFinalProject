package com.mySpring.myapp.favorites.service;

import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mySpring.myapp.favorites.dao.FavoriteDAO;
import com.mySpring.myapp.favorites.vo.FavoriteVO;

@Service
public class FavoriteService {

    private static final Logger logger = LoggerFactory.getLogger(FavoriteService.class);

    @Autowired
    private FavoriteDAO favoriteDAO;

    public void addFavorite(FavoriteVO favoriteData) throws Exception {
        logger.info("Adding favorite for userId: {} and washId: {}", favoriteData.getUserId(), favoriteData.getWashId());
        Map<String, Object> favoriteMap = Map.of(
            "userId", favoriteData.getUserId(),
            "washId", favoriteData.getWashId()
        );
        favoriteDAO.insertFavorite(favoriteMap);
        logger.info("Favorite added successfully for userId: {}", favoriteData.getUserId());
    }

    public void removeFavorite(FavoriteVO favoriteData) throws Exception {
        logger.info("Removing favorite for userId: {} and washId: {}", favoriteData.getUserId(), favoriteData.getWashId());
        Map<String, Object> favoriteMap = Map.of(
            "userId", favoriteData.getUserId(),
            "washId", favoriteData.getWashId()
        );
        favoriteDAO.deleteFavorite(favoriteMap);
        logger.info("Favorite removed successfully for userId: {}", favoriteData.getUserId());
    }

    public List<FavoriteVO> getFavoritesByUserId(String userId) throws Exception {
        logger.info("Fetching favorites for userId: {}", userId);
        List<FavoriteVO> favorites = favoriteDAO.selectFavoritesByUserId(userId);
        logger.info("Fetched {} favorites for userId: {}", favorites.size(), userId);
        return favorites;
    }

    public List<FavoriteVO> getAllFavorites() throws Exception {
        logger.info("Fetching all favorites");
        List<FavoriteVO> favorites = favoriteDAO.selectAllFavorites();
        logger.info("Fetched {} favorites", favorites.size());
        return favorites;
    }
}
