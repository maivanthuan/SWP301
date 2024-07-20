/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.PitchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.Map;
import java.util.Vector;
import model.Pitch;

/**
 *
 * @author thuan
 */
@MultipartConfig
public class EditPitchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pitchID = request.getParameter("pitchID");

        // lay ra danh sach san pham
        PitchDAO pid = new PitchDAO();
        Vector<Pitch> listPi;
        listPi = pid.getAllPitch();
        request.setAttribute("listPi", listPi);

        Pitch pi = pid.getPitchByID(pitchID);
        request.setAttribute("pi", pi);

        request.getRequestDispatcher("pitchManager.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // lay ra thong tin cua san pham sau khi cap nhat
        String pitchID = request.getParameter("pitchID");
        int pitchType = Integer.parseInt(request.getParameter("pitchType"));
        int price = Integer.parseInt(request.getParameter("price"));
        PitchDAO pid = new PitchDAO();
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dspq82lmr",
                "api_key", "977788362272316",
                "api_secret", "BY2hb1uuR_LyiFapfoJ4ig-yFok"
        ));
        Part filePart = request.getPart("file");
        String imageUrl = pid.getPitchByID(pitchID).getImage();
        String fileName = filePart.getSubmittedFileName();
        if (!fileName.isEmpty()) {
            String filePath = getServletContext().getRealPath("/") + File.separator + fileName;
            filePart.write(filePath);
            File fileToUpload = new File(filePath);
            Map uploadResult = cloudinary.uploader().upload(fileToUpload, ObjectUtils.emptyMap());
            imageUrl = (String) uploadResult.get("url");
        }
        // cap nhat san pham
        Pitch pitchUpdate = new Pitch(pitchID, pitchType, imageUrl, price);

        pid.editPitch(pitchID, pitchUpdate);
        response.sendRedirect("PitchManager");
//        // lay ra danh sach san pham
//        List<Pitch> listPi;
//        listPi = pid.getAllPitch();
//        String page = request.getParameter("page");
//        int p = 1;
//        request.setAttribute("totalPage", (int) Math.ceil((double) listPi.size() / 8.0));
//        if (page != null) {
//            try {
//                p = Integer.parseInt(page);
//                if (p <= 0) {
//                    p = 1;
//                }
//                if (p > Math.ceil((double) listPi.size() / 8.0)) {
//                    p = (int) Math.ceil((double) listPi.size() / 8.0);
//                }
//            } catch (Exception e) {
//            }
//        }
//        if (listPi.size() > 8) {
//            listPi = listPi.subList(0 + (8 * (p - 1)), (8 + (8 * (p - 1))) > listPi.size() ? listPi.size() : (8 + (8 * (p - 1))));
//        }
//
//        request.setAttribute("currPage", p);
//        request.setAttribute("listPi", listPi);
//
//        request.getRequestDispatcher("list-pitch.jsp").forward(request, response);

    }
}
