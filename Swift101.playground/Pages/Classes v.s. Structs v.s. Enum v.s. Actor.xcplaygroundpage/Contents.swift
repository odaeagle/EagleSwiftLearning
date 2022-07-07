/*:
 
# Class v.s. Struct v.s. Enum v.s. Actor

 Class:

 - Reference type
 - Inheritance ✅ conform to protocol ✅
 - init ✅ deinit ✅
 - properties ✅ methods ✅ subscripts ✅
 - thread-safe ❌

 Actor:

 - Reference type
 - Inheritance ❌ conform to protocol ✅
 - init ✅ deinit ✅
 - properties ✅ methods ✅ subscripts ✅
 - thread-safe ✅

 Struct:

 - Value Type
 - Inheritance ❌ conform to protocol ✅
 - init ✅ deinit ❌
 - thread-safe ❌

 Enum:

 - Value Type
 - Inheritance ❌ conform to protocol ✅
 - init ✅ deinit ❌
 - properties ✅ methods ✅ subscripts ✅
 - thread-safe ❌

# When are each one best for?

 - Almost always use an `Enum` for transactional data.
 - Almost always use an `Actor` for isolated data.
 - Use a `Struct` to group bits of transactional data
 - Use `Class` when you need reference semantics and don't care about concurrent access
 - Use `Class` when you need subclass NSObject
 */

