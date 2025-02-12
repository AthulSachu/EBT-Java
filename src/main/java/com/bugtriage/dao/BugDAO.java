package com.bugtriage.dao;

import com.bugtriage.models.Bug;
import com.bugtriage.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BugDAO {

    // Method to add a new bug
    public boolean addBug(Bug bug) {
        String query = "INSERT INTO bugs (title, description, priority, status, severity, reporter_id, assigned_to, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, bug.getTitle());
            stmt.setString(2, bug.getDescription());
            stmt.setString(3, bug.getPriority());
            stmt.setString(4, bug.getStatus());
            stmt.setString(5, bug.getSeverity());
            stmt.setInt(6, bug.getReporterId());
            stmt.setInt(7, bug.getAssignedTo());
            stmt.setTimestamp(8, new Timestamp(bug.getCreatedAt().getTime()));
            stmt.setTimestamp(9, new Timestamp(bug.getUpdatedAt().getTime()));

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to retrieve a bug by ID
    public Bug getBugById(int bugId) {
        String query = "SELECT * FROM bugs WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, bugId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Bug(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("priority"),
                        rs.getString("status"),
                        rs.getString("severity"),
                        rs.getInt("reporter_id"),
                        rs.getInt("assigned_to"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to retrieve all bugs
    public List<Bug> getAllBugs() {
        List<Bug> bugs = new ArrayList<>();
        String query = "SELECT * FROM bugs";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                bugs.add(new Bug(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("priority"),
                        rs.getString("status"),
                        rs.getString("severity"),
                        rs.getInt("reporter_id"),
                        rs.getInt("assigned_to"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bugs;
    }

    // Method to update a bug
    public boolean updateBug(Bug bug) {
        String query = "UPDATE bugs SET title = ?, description = ?, priority = ?, status = ?, severity = ?, assigned_to = ?, updated_at = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, bug.getTitle());
            stmt.setString(2, bug.getDescription());
            stmt.setString(3, bug.getPriority());
            stmt.setString(4, bug.getStatus());
            stmt.setString(5, bug.getSeverity());
            stmt.setInt(6, bug.getAssignedTo());
            stmt.setTimestamp(7, new Timestamp(bug.getUpdatedAt().getTime()));
            stmt.setInt(8, bug.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to delete a bug
    public boolean deleteBug(int bugId) {
        String query = "DELETE FROM bugs WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, bugId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to retrieve bugs assigned to a specific user
    public List<Bug> getBugsByUser(int userId) {
        List<Bug> bugs = new ArrayList<>();
        String query = "SELECT * FROM bugs WHERE assigned_to = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                bugs.add(new Bug(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("priority"),
                        rs.getString("status"),
                        rs.getString("severity"),
                        rs.getInt("reporter_id"),
                        rs.getInt("assigned_to"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bugs;
    }

    // Method to update bug status
    public boolean updateBugStatus(int bugId, String newStatus) {
        String query = "UPDATE bugs SET status = ?, updated_at = NOW() WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, newStatus);
            stmt.setInt(2, bugId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

