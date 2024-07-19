/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.PitchDAO;
import dao.PricePitchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Pitch;
import model.PricePitch;

/**
 *
 * @author thuan
 */
@MultipartConfig
public class AddPitchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PitchDAO dao = new PitchDAO();
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dspq82lmr",
                "api_key", "977788362272316",
                "api_secret", "BY2hb1uuR_LyiFapfoJ4ig-yFok"
        ));
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String filePath = getServletContext().getRealPath("/") + File.separator + fileName;
        filePart.write(filePath);
        File fileToUpload = new File(filePath);
        Map uploadResult = cloudinary.uploader().upload(fileToUpload, ObjectUtils.emptyMap());
        String imageUrl = (String) uploadResult.get("url");
        String pid = request.getParameter("pitchID");
        System.out.println("id "+pid);
        int ptype = Integer.parseInt(request.getParameter("pitchType"));
        int pprice = Integer.parseInt(request.getParameter("price"));
        String ptimestart = request.getParameter("timestart");
        String ptimeend = request.getParameter("timeend");
        
        PricePitchDAO pidao = new PricePitchDAO();
        
        Pitch pitch = new Pitch(pid, ptype, imageUrl, pprice);
        try {
            dao.insertPitch(pitch);
            Pitch pitch1=dao.getPitchByID1(pid);
            System.out.println("pitch id "+pitch1.toString());
            try{
                            PricePitch pricepitch = new PricePitch("",pitch1 , pprice, ptimestart, ptimeend);
            pidao.insertPricePitch(pricepitch);
            }
            catch (SQLException ex) {
            Logger.getLogger(AddPitchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        } catch (SQLException ex) {
            System.out.println("concac");
        }
        response.sendRedirect("PitchManager");

    }
}
