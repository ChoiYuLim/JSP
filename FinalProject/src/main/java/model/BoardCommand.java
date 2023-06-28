package model;

import java.util.ArrayList;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface BoardCommand {
    ArrayList<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response);
      
}
