package com.example.opentelemetry.greeting

import kotlinx.coroutines.coroutineScope
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class Greeting {
    @GetMapping("/greeting")
    suspend fun greeting(): String {
        return coroutineScope {
            "Hello World"
        }
    }
}