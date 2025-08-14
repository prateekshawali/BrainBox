# 🧠 BrainBox - Knowledge Management System

BrainBox is a modern article management platform with comprehensive role-based access control that enables organizations to collaborate securely on knowledge sharing and content management.

## 🚀 Features

- **Advanced Role-Based Access Control**: Granular permissions based on user roles
- **Article Management System**: Create, edit, review, approve, and publish articles
- **Searchable Interface**: Fast, client-side search functionality across all content
- **Responsive Dashboard**: Role-specific dashboards with relevant information
- **Secure Authentication**: Spring Security integration with BCrypt password encryption

## 🛡️ Role Hierarchy

| Role        | Permissions                                                    |
|-------------|---------------------------------------------------------------|
| **Admin**   | Full system access with user management and article control    |
| **Editor**  | Edit any articles and review contributor submissions           |
| **Contributor** | Create and edit their own articles before approval         |
| **Reviewer**| Approve or reject submitted articles                           |
| **Viewer**  | Read-only access to approved articles                          |

## 🔧 Technical Stack

- **Backend**: Java with Spring Boot 3.x
- **Security**: Spring Security with JWT authentication
- **Database**: H2 (development) / MySQL (production)
- **Frontend**: Thymeleaf templates with Bootstrap and JavaScript
- **Build Tool**: Maven

## 🏃‍♂️ Quick Start

1. Clone the repository
2. Configure the database in `application.properties`
3. Run using `./mvnw spring-boot:run`
4. Access the application at `http://localhost:8080`
5. Login with:
   - Admin: username `john` / password `password123`
   - Contributor: username `contributor_1` / password `password123`

## 📝 Usage

The system features different dashboards for each role:

- **Admin Dashboard**: Complete management console with user administration
- **Editor Dashboard**: Article review queue with editing capabilities
- **Contributor Dashboard**: Content creation and submission workflow
- **Reviewer Dashboard**: Approval interface for submitted content
- **Viewer Dashboard**: Clean reading interface for approved articles

## 💻 Development

### Database Schema
The application uses a normalized database schema with the following core tables:
- `users` - User accounts and authentication details
- `role` - Available system roles
- `user_roles` - Many-to-many mapping between users and roles
- `article` - Content with metadata and approval status

### Search Implementation
The search functionality is implemented client-side using JavaScript to provide:
- Real-time filtering of articles and content
- Multi-field search across titles and content
- Role-appropriate search results

## 📄 License
MIT License

---

© 2025 BrainBox Knowledge Management System
