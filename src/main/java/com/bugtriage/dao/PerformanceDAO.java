package com.bugtriage.dao;

import com.bugtriage.models.Performance;
import com.bugtriage.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PerformanceDAO {

    // Method to add performance data
    public boolean addPerformance(Performance performance) {
        String query = "INSERT INTO performance (user_id, bugs_resolved, bugs_reported, average_resolution_time, performance_rating, award) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, performance.getUserId());
            stmt.setInt(2, performance.getBugsResolved());
            stmt.setInt(3, performance.getBugsReported());
            stmt.setDouble(4, performance.getAverageResolutionTime());
            stmt.setString(5, performance.getPerformanceRating());
            stmt.setString(6, performance.getAward());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to retrieve performance data by user ID
    public Performance getPerformanceByUserId(int userId) {
        String query = "SELECT * FROM performance WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Performance(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("bugs_resolved"),
                        rs.getInt("bugs_reported"),
                        rs.getDouble("average_resolution_time"),
                        rs.getString("performance_rating"),
                        rs.getString("award")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to retrieve all performance records
    public List<Performance> getAllPerformance() {
        List<Performance> performanceList = new ArrayList<>();
        String query = "SELECT * FROM performance";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                performanceList.add(new Performance(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("bugs_resolved"),
                        rs.getInt("bugs_reported"),
                        rs.getDouble("average_resolution_time"),
                        rs.getString("performance_rating"),
                        rs.getString("award")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return performanceList;
    }

    // Method to update performance data
    public boolean updatePerformance(Performance performance) {
        String query = "UPDATE performance SET bugs_resolved = ?, bugs_reported = ?, average_resolution_time = ?, performance_rating = ?, award = ? WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, performance.getBugsResolved());
            stmt.setInt(2, performance.getBugsReported());
            stmt.setDouble(3, performance.getAverageResolutionTime());
            stmt.setString(4, performance.getPerformanceRating());
            stmt.setString(5, performance.getAward());
            stmt.setInt(6, performance.getUserId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to delete performance data by user ID
    public boolean deletePerformance(int userId) {
        String query = "DELETE FROM performance WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to calculate performance rating based on bugs resolved
    public String calculatePerformanceRating(int bugsResolved) {
        if (bugsResolved >= 50) {
            return "Excellent";
        } else if (bugsResolved >= 30) {
            return "Good";
        } else if (bugsResolved >= 10) {
            return "Average";
        } else {
            return "Needs Improvement";
        }
    }

    // Method to update awards based on performance
    public String determineAward(String performanceRating) {
        switch (performanceRating) {
            case "Excellent":
                return "Employee of the Month";
            case "Good":
                return "Star Performer";
            default:
                return "No Award";
        }
    }

    // Method to update performance ratings and awards for all users
    public void updatePerformanceRatingsAndAwards() {
        List<Performance> performances = getAllPerformance();
        for (Performance p : performances) {
            String newRating = calculatePerformanceRating(p.getBugsResolved());
            String newAward = determineAward(newRating);
            p.setPerformanceRating(newRating);
            p.setAward(newAward);
            updatePerformance(p);
        }
    }
}
