using System;

namespace common
{
    public enum LoginStatus
    {
        OK,
        AccountNotExists,
        InvalidCredentials
    }

    public enum RegisterStatus
    {
        OK,
        UsedEmail,
        UsedName,
        InvalidName,
    }

    public enum GuildCreateStatus
    {
        OK,
        InvalidName,
        UsedName
    }

    public enum AddGuildMemberStatus
    {
        OK,
        NameNotChosen,
        AlreadyInGuild,
        InAnotherGuild,
        IsAMember,
        GuildFull,
        Error
    }

    public enum CreateStatus
    {
        OK,
        ReachCharLimit,
        SkinUnavailable,
        Locked
    }

    public static class StatusInfo
    {
        public static string GetInfo(this LoginStatus status)
        {
            switch (status)
            {
                case LoginStatus.InvalidCredentials:
                    return "Bad Login";
                case LoginStatus.AccountNotExists:
                    return "Bad Login";
                case LoginStatus.OK:
                    return "OK";
            }
            throw new ArgumentException("status");
        }

        public static string GetInfo(this RegisterStatus status)
        {
            switch (status)
            {
                case RegisterStatus.UsedEmail:
                    return "Duplicate Email";
                case RegisterStatus.UsedName:
                    return "Duplicate Name";
                case RegisterStatus.InvalidName:
                    return "Invalid Name. Names must only contain letters and be 3-10 characters long.";
                case RegisterStatus.OK:
                    return "OK";
            }
            throw new ArgumentException("status");
        }

        public static string GetInfo(this CreateStatus status)
        {
            switch (status)
            {
                case CreateStatus.ReachCharLimit:
                    return "Too many characters";
                case CreateStatus.OK:
                    return "OK";
            }
            throw new ArgumentException("status");
        }
    }
}
