## Build tools & versions used
Xcode version 13.2 (Latest update available on the mac I'm using).

## Steps to run the app
Just click Run! I'm using scene delegates here, so on initialization, a table view controller is created, which makes a view model, which immediately makes the network call. Feel free to test out the different URLs by swapping the urlToUse property in EmployeeListViewModel (line 19).

## What areas of the app did you focus on?
Tried to make the whole thing run smooth with decent UI and alerts to show the user app state when necessary.

## What was the reason for your focus? What problems were you trying to solve?
Nothing crazy here. Just trying to make the app run smooth for the end user. With some apps, when errors occur, I find myself waiting with nothing happening in the background. I was hoping to provide some insight so that doesn't happen here.

## How long did you spend on this project?
Initially, approximately 3 hours with an additional 1 hour for code cleanup/UI changes/unit tests.

## Did you make any trade-offs for this project? What would you have done differently with more time?
I don't believe so. I would add more screens for employee detail, but the prompt specifically stated not to add any additional screens.

## What do you think is the weakest part of your project?
With more time, I think a collection view with clever UI (think home screen app icons on an iPhone, each indicating an employee) would make this look much better. Given the time frame, I chose to go with a table view. I focused on Phone/iPod display here. I'm sure the UI could be improved if developing for tablets.

## Did you copy any code or dependencies? Please make sure to attribute them here!
General URL session stuff from previous projects. The APIDataProvidable and DataProvidable protocols were used in previous projects and I love the layer of abstraction they provide. 

## Is there any other information you’d like us to know?
I'm excited to get together and further improve this! Let me know what you think.
