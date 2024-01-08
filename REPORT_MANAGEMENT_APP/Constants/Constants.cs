namespace REPORT_MANAGEMENT_APP
{
    public class Constants
    {
        public const string EMAIL_ADMIN = "admin@viettel.com.vn";
        public const string AUTH_ADMIN = @"123456aA@";
        public const string HOMETOWN = "Vietnam";
        public const int ROWS_PER_PAGE = 10;
    }

    public enum Roles
    {
        SuperAdmin,
        Assistant,
        Administrator,
        Moderator,
        Manager,
        Basic,
        Normal
    }

    public enum Claims
    {
        RequestApproval,
        Approved,
        Rejected
    }

    public enum Status
    {
        Error,
        Success
    }

    public enum ClaimTypesExtension
    {
        Permission,
        Email,
        UserName,
        DateJoining
    }

    public enum ClaimValuesExtension
    {
        CanManageFile
    }
}
