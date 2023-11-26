@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String country = 'United States';
        List<String> result = ParkLocator.country(country);
        // Verify that a fake result is returned
        List<String> expectedResultParks = new List<String>{'Yosemite'};
        System.assertEquals(expectedResultParks, result); 
    }
}