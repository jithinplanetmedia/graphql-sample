class Queries{
   String loginQuery = r"""mutation Login($input : LoginInput!) {
    login(input: $input) {
        accessToken
        refreshToken
        user {
            avatarUrl
            createdAt
            email
            emailVerified
            firstName
            fullName
            id
            invitationStatus
            lastName
            phoneNumber
            status
            updatedAt
            userName
        }
    }
}     
 """;

 String fetchAllJobs = r"""query FetchJobs {
    fetchJobs {
        createdAt
        customerStatus
        expectedDelivery
        id
        jobCode
        jobCompletedOn
        jobStartedOn
        notes
        paymentStatus
        status
        timerStatus
        totalCost
        updatedAt
    }
} """;

}