import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import domain.dao.itemDao;
import domain.dto.itemDto;

public class app {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		String str_date = "2024-04-02";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date =formatter.parse(str_date);
		
		itemDao dao = new itemDao();

		dao.Insert(new itemDto(1111,1111,"로지텍마우스","전자제품",3000,1,date));
//		dao.delete(1111);
	}
}

	
	
	