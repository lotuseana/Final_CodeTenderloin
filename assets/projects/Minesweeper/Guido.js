/*
 * Guido.js - A JavaScript library for creating interactive buttons
 * Based on the original Guido library for Processing
 */

(function() {
    'use strict';

    // Global Guido namespace
    window.Guido = window.Guido || {};

    // Interactive manager
    var Interactive = {
        elements: [],
        mouseX: 0,
        mouseY: 0,
        mousePressed: false,
        mouseButton: 0,
        
        add: function(element) {
            this.elements.push(element);
        },
        
        remove: function(element) {
            var index = this.elements.indexOf(element);
            if (index > -1) {
                this.elements.splice(index, 1);
            }
        },
        
        update: function() {
            for (var i = 0; i < this.elements.length; i++) {
                var element = this.elements[i];
                if (element.update) {
                    element.update();
                }
            }
        },
        
        mousePressed: function() {
            this.mousePressed = true;
            for (var i = 0; i < this.elements.length; i++) {
                var element = this.elements[i];
                if (element.mousePressed) {
                    element.mousePressed();
                }
            }
        },
        
        mouseReleased: function() {
            this.mousePressed = false;
            for (var i = 0; i < this.elements.length; i++) {
                var element = this.elements[i];
                if (element.mouseReleased) {
                    element.mouseReleased();
                }
            }
        },
        
        mouseMoved: function(x, y) {
            this.mouseX = x;
            this.mouseY = y;
            for (var i = 0; i < this.elements.length; i++) {
                var element = this.elements[i];
                if (element.mouseMoved) {
                    element.mouseMoved(x, y);
                }
            }
        }
    };

    // Make Interactive available globally
    window.Interactive = Interactive;

    // Mouse event handlers
    document.addEventListener('mousedown', function(e) {
        Interactive.mousePressed();
    });

    document.addEventListener('mouseup', function(e) {
        Interactive.mouseReleased();
    });

    document.addEventListener('mousemove', function(e) {
        Interactive.mouseMoved(e.clientX, e.clientY);
    });

})(); 