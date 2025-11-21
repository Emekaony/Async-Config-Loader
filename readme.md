## Asynchronous Config Loader

- The goal of this project is to deepen my understanding of concurrent programming with coroutines
- The architecture is simple: We have a Config loader that calls performs 3 tasks concurrently:
  - Reads data from an API
  - Calls data from the disk
  - Remote storage
- These are all gonna be simulated with functions that delay time for now
- That's about it. The goal is to understand the intricacies of suspended functions as well as async/await operations.

