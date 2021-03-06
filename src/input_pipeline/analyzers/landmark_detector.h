#ifndef FACERIG_LANDMARK_DETECTOR_H
#define FACERIG_LANDMARK_DETECTOR_H

#include <opencv2/opencv.hpp>
#include <dlib/opencv/cv_image.h>
#include <dlib/image_processing.h>

#include <array>


struct LandmarkDetector {
public:
    virtual std::array<cv::Point, 68> detect_landmarks(const cv::Mat& frame, const cv::Rect& face) = 0;
};


std::unique_ptr<LandmarkDetector> make_dlib_landmark_detector(const char* source_filepath);

#endif //FACERIG_LANDMARK_DETECTOR_H
