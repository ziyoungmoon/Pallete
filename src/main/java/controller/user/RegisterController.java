package controller.user;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import service.dto.Member;
import service.manager.MemberManager;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.servlet.*;

public class RegisterController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
                     
       String filename = null;       
      
       boolean check = ServletFileUpload.isMultipartContent(request);             
      if(check) {    
         ServletContext context = request.getServletContext();
         String path = context.getRealPath("/upload");
         File dir = new File(path);         
            
                        
         if (!dir.exists()) dir.mkdir(); 
         
         try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
               
                factory.setSizeThreshold(10 * 1024);
                   
                factory.setRepository(dir);
                               
    
                ServletFileUpload upload = new ServletFileUpload(factory);
                   
                upload.setSizeMax(10 * 1024 * 1024);
                
                upload.setHeaderEncoding("utf-8");
                   
                                
                List<FileItem> items = (List<FileItem>)upload.parseRequest(request);                
                                   
                for (int i = 0; i < items.size(); ++i) {
                   FileItem item = (FileItem)items.get(i);            
                   
                   String value = item.getString("utf-8");                 
                   
                      
                      if (item.getFieldName().equals("picture")) {
                         
                         
                        filename = UUID.randomUUID().toString() + "_" ;  
                           

                            System.out.println("uploaded file: " + filename);
                           
                         File file = new File(dir, filename);
                         item.write(file);
                         
                      }
                   }
           
                
         } catch(SizeLimitExceededException e) {
            
            e.printStackTrace();           
            } catch(FileUploadException e) {
               
                e.printStackTrace();
            } catch(Exception e) {            
                e.printStackTrace();
            }
               
         request.setAttribute("dir", dir);
         request.setAttribute("filename", filename);
         
          MemberManager manager = MemberManager.getInstance();
          Member member = manager.findMember(UserSessionUtils.getLoginUserId(request.getSession()));
          int update = manager.updateMemberImg(member, member.getId(), member.getPassword(), member.getName(), member.getEmail(), member.getPart(), member.getPhoneNum(), member.getPosition(), filename);
             
      }      
        
        return "redirect:/user/list";
      
    }
}