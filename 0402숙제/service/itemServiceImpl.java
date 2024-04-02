package domain.service;


import java.sql.SQLException;
import java.util.List;

import domain.dao.itemDao;
import domain.dto.itemDto;

public class itemServiceImpl {
    private itemDao dao;

    public itemServiceImpl() throws Exception {
       
            dao = new itemDao();
            
       
        }
    public List<itemDto> selectAllitem() throws SQLException{
    	return dao.selectAll();
    }
    public itemDto selectitemforUser(int item_id) throws SQLException {
    	return dao.select(item_id);
    }
    public void  additemforBussinessMan(itemDto dto) throws SQLException {
    	dao.Insert(dto);
    }
    public void delitemforBussinessMan(int item_id) throws SQLException {
    	
    	dao.delete(item_id);
		
    }
    public void updateitemforBussinessMan(itemDto dto) throws SQLException {
    	dao.update(dto);
    }
    

  
    
    }

   

