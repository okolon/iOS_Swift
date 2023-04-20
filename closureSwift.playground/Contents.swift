import UIKit


// normal function
func destinationReached() {
    print("You've arrived at your food spot")
}

// let y = destinationReached() doesn't work

// examaple of closure
let arrived = {
    print("You've reached your destination. Enjoy!")
}

let x = arrived
arrived()

// a closure is an unnamed function that can be assigned as a variable or passed to another function

let destination = 0.9

func calculateDistance (yourPosition: Double, completion:(Double) -> Void) {
    let position = destination - yourPosition
    completion(position)
}

calculateDistance(yourPosition: 0.5) { value in
    print(value)
}

//Non-Escaping Closures (by default, all closures are non-escaping) see arrived() example

//Escaping Closures
func doSometask (onCompletion: @escaping (String) ->Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        onCompletion("Review sent")
    }
    print("Restaurant selected")
}

doSometask { input in
    print(input)
}

// trailing closure

func selectRestaurant(action: () -> Void) {
    print("Which Kebab place?")
    action("hello")
    print("Restaurant selected!")
}

selectRestaurant {
    print("King Kebab")
}
