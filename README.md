# oyster_card

Creating a project that acts like an oyster card.


1. Create a Gemfile
- [x] Construct a valid Gemfile
- [x] Specify a correct source for gems
- [x] Specify the latest Ruby version
- [x] Add the rspec gem to ‘test’ and ’development’ groups
- [x] Commit only this Gemfile

  DONE

2. Create RSpec conventional files
- [x] Generate conventional files (helper and config) for an RSpec project using a command-line option of the rspec executable file
- [x] Follow RSpec naming convention for files and folders
- [x] Create a test file for the Oystercard class without any tests but with a describe block (doesn't exist yet)

  DONE

3. Learn debugging basics
- [x] Write down the file path where the error happened
*/Users/jackhooper/Documents/Makers/Week Two - (Full Course)/oyster_card/spec/oystercard_spec.rb*
- [x] Write down the line number of the error
*rb:2*
- [x] Use the Ruby Documentation to find out what the error means
*There is no Oystercard class so cannot produce anything*
- [x] Suggest one way of solving the error
*Create an Oystercard class in a lib dir*

  DONE

4. Add the balance
- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Create a unit test for the Oystercard class
- [x] Write a failing test that checks that a new card has a balance
- [x] Write code that will make this test pass
- [x] Now refactor by setting the balance in initialize using an instance variable
- [x] Remove the balance method entirely and replace with an attr_reader

  DONE

5. Enable top up functionality
- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Write a test for the top_up method
- [x] Make sure the test fails before implementing the method
- [x] Implement the method to make the test pass

DONE

6. Enforce maximum balance
- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Write a test that checks the `top_up` method throws an exception if the new balance would exceed the limit.
- [x] Use a constant to store the limit
- [x] Implement the limit in the top_up method. Use an inline `if` statement to check if the limit would be exceeded
- [x] Make the error message include the limit value
- [x] Use interpolation to keep your code DRY

  DONE

7. Deduct the money
- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Write a test for the `deduct` method, see it fail
- [x] Implement the method, see the test pass

  DONE

8. Add touch in/out support
- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Write tests for `in_journey?`, `touch_in` and `touch_out`
- [x] Write implementation of these methods that will make the tests pass
- [x] Use an instance variable to track whether the card is in use
- [x] Use an RSpec predicate matcher to check if the card is in use
- [x] Use boolean values to store the state of the card

  DONE

9. Checking minimum balance on touch in
- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Write a test that checks that an error is thrown if a card with insufficient balance is touched in
- [x] Write the implementation
- [x] Update existing tests, if necessary, to make sure they still pass
- [x] Refactor to remove any magic numbers and replace with a constant

10. Charging for the journey
- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Write a test that uses `expect {}.to change{}.by()` syntax to check that a charge is made on touch out.
- [x] Update the `touch_out` method to make the test pass
- [x] Make '#deduct' a private method
- [x] Keep the code DRY


11. Saving the entry station

- [x] Write up a plan for how you will interact with your code and manually test in IRB
- [x] Using a double, write a test that expects the card to remember the entry station after the touch in
- [x] Update the `touch_in` method to accept the entry station
- [x] Update existing tests to pass a station to the `touch_in` method - you may need to declare your double in a `let` statement at the top of your describe block
- [x] Expose `entry_station` instance variable using an attribute reader
- [x] Make the card forget the entry station on touch out by setting it to `nil`
- [x] When your tests are all green, refactor to remove the `in_journey` variable. Rewrite the `in_journey?` method to infer its status based on whether or not there is an entry station

DONE#

12. Adding journey history
- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Store the list of journeys as an instance variable and expose it with an attribute reader - you will need to refactor the touch_out method to accept an exit station
- [x] Use a hash to store one journey (set of an entry and exit stations)
- [x] Write a test that checks that the card has an empty list of journeys by default
- [x] Write a test that checks that touching in and out creates one journey
- [x] Keep all code including tests DRY

DONE #

13.  Creating the station class
- [x] Write up a plan for how you will interact with your code and manually test in IRB
- [x] Test drive the creation of a Station class that exposes a name and a zone variable
- [x] Use only one expectation per test

Done #

14. Handling a journey without a touch out
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] Update your test suite to reflect a new Journey class
- [ ] Create a new class Journey and move the functionality that relates to a journey from Oystercard to Journey
- [ ] Make sure all tests pass, all existing functionality is preserved
- [ ] The `#fare` method should return the minimum fare (for the moment), or the penalty fare of 6 if there was either no entry station or no  exit station.
- [ ] Make sure the entire codebase is DRY
- [ ] Make sure all methods are three lines or shorter


----------------------------------

User story 1
| In order to use public transport|
|As a customer|
|I want money on my card|

User story 2
|In order to keep using public transport|
|As a customer|
|I want to add money to my card|

|In order to protect my money from theft or loss|
|As a customer|
|I want a maximum limit (of £90) on my card|

>oyster.top_up(40)
>> "Card succesfully topped up. Balance is now £40."
>oyster.top_up(60)
>> "Card max limit is £90. Top up failed, no money added."

|In order to pay for my journey|
|As a customer|
|I need my fare deducted from my card|

>oyster.deduct(4)
>> £4 Fare deducted. New balance is £36.

|In order to get through the barriers.|
|As a customer|
|I need to touch in and out.|

>oyster.touch_in
>> allows user to go through barriers

|In order to pay for my journey|
|As a customer|
|I need to have the minimum amount (£1) for a single journey.|

> oyster.balance
>> 0.5
> oyster.touch_in
>> "error: Card does not have the MINIMUM_BALANCE of £1. Please top up."

|In order to pay for my journey|
|As a customer|
|When my journey is complete, I need the correct amount deducted from my card|

In order to pay for my journey
As a customer
I need to know where I've travelled from

>oyster.touch_in(station)
>>@current_station = station
>oyster.current_station = station

In order to know where I have been
As a customer
I want to see all my previous trips

>oyster.check_history
>>list all previous trips


In order to know how far I have travelled
As a customer
I want to know what zone a station is in


In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out