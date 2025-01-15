package com.mySpring.myapp.favorites.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mySpring.myapp.favorites.vo.FavoriteVO;

@Repository
public class FavoriteDAO {

    @Autowired
    private SqlSession sqlSession;

    public void insertFavorite(Map<String, Object> favoriteData) {
        sqlSession.insert("FavoriteMapper.insertFavorite", favoriteData);
    }

    public void deleteFavorite(Map<String, Object> favoriteData) {
        sqlSession.delete("FavoriteMapper.deleteFavorite", favoriteData);
    }

    public List<FavoriteVO> selectFavoritesByUserId(String userId) {
        return sqlSession.selectList("FavoriteMapper.selectFavoritesByUserId", userId);
    }

    public List<FavoriteVO> selectAllFavorites() {
        return sqlSession.selectList("FavoriteMapper.selectAllFavorites");
    }
}
