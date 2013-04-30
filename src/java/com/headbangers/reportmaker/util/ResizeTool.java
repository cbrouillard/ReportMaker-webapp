package com.headbangers.reportmaker.util;

import java.io.IOException;

public class ResizeTool {

    public static String resizeAllReportImages(final String reportId) {

        ProcessBuilder pb = new ProcessBuilder("resize-twr-img.sh", reportId);
        try {
            pb.start();
        } catch (IOException e) {
            return e.getMessage();
        }

        return "ok";
    }

    public static void resizeOneReportImage(final String reportId, final String image) {
        ProcessBuilder pb = new ProcessBuilder("resize-twr-one-img.sh", reportId, image);
        try {
            pb.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
