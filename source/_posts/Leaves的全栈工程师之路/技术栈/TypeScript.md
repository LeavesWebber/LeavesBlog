---
title: TypeScript概览笔记
tags:
  - typescript
  - 前端
categories:
  - Leaves的全栈工程师之路
  - 技术栈
date:
updated:
---
> [!todo]+ 熟练掌握JavaScript
> - [ ] [[JS入门|熟练掌握JavaScript]]

TypeScript 是 JavaScript 的超集，添加了静态类型、接口和其他特性，使 JavaScript 更加灵活和安全。它能够帮助开发者更容易构建和维护大型的应用程序，并且与现有的 JavaScript 代码完全兼容。

TypeScript 的特点

	1.	静态类型检查
TypeScript 通过引入类型系统（如字符串、数字、布尔值、对象等），在编译时检查代码中的类型错误。这能帮助在开发阶段捕获潜在的错误，减少运行时的问题。
	2.	编译成 JavaScript
TypeScript 代码需要被编译成 JavaScript，因为浏览器和 Node.js 只能执行 JavaScript。通过 TypeScript 编译器（tsc），你可以把 .ts 文件转换为 .js 文件。
	3.	增强的 IDE 支持
由于 TypeScript 提供了类型信息，它能够极大地提高开发工具的自动补全、重构和类型提示功能，使得开发体验更加流畅。
	4.	向后兼容 JavaScript
TypeScript 是 JavaScript 的超集，因此任何合法的 JavaScript 代码在 TypeScript 中也是合法的。这意味着你可以逐步将现有的 JavaScript 项目迁移到 TypeScript。
	5.	面向对象编程特性
TypeScript 支持类、接口、枚举等面向对象的编程特性，帮助开发者组织代码并提高可读性和可维护性。

TypeScript 的核心概念

	1.	类型系统
TypeScript 通过在变量、函数、对象等地方显式定义类型，确保类型一致性。

let isDone: boolean = false;
let count: number = 42;
let name: string = 'Alice';

function greet(person: string): string {
  return `Hello, ${person}`;
}

greet('Alice'); // 正确
// greet(42);   // 错误，参数类型不匹配


	2.	接口 (Interfaces)
接口用来定义对象的形状，指定对象的类型结构。它可以用来定义函数、对象的结构，也可以作为类的约束。

interface Person {
  name: string;
  age: number;
}

function printPerson(person: Person) {
  console.log(`Name: ${person.name}, Age: ${person.age}`);
}

let alice: Person = { name: 'Alice', age: 25 };
printPerson(alice);


	3.	类 (Classes)
TypeScript 支持面向对象编程中的类定义，可以使用 class 关键字创建类，并支持继承和访问控制符（如 public、private、protected）。

class Animal {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  move(distance: number = 0) {
    console.log(`${this.name} moved ${distance} meters.`);
  }
}

class Dog extends Animal {
  bark() {
    console.log('Woof! Woof!');
  }
}

let dog = new Dog('Buddy');
dog.bark();
dog.move(10);


	4.	类型推断
TypeScript 可以根据上下文自动推断类型。虽然可以显式声明类型，但在某些情况下，TypeScript 能自动推断变量的类型。

let message = 'Hello World';  // 自动推断为 string 类型


	5.	联合类型和类型守卫
通过联合类型，变量可以有多个可能的类型；类型守卫用于在运行时判断变量的类型。

function printId(id: number | string) {
  if (typeof id === 'string') {
    console.log(`ID as string: ${id}`);
  } else {
    console.log(`ID as number: ${id}`);
  }
}

printId(123);      // 输出：ID as number: 123
printId('ABC');    // 输出：ID as string: ABC


	6.	枚举 (Enums)
枚举是用于定义一组命名常量的类型，常用于状态值的处理。

enum Direction {
  Up = 1,
  Down,
  Left,
  Right
}

let dir: Direction = Direction.Up;
console.log(dir); // 输出 1


	7.	泛型 (Generics)
泛型使函数或类能够适用于多种类型，增强了代码的复用性和灵活性。

function identity<T>(arg: T): T {
  return arg;
}

let output1 = identity<string>('Hello');
let output2 = identity<number>(42);



TypeScript 和 JavaScript 的区别

	•	类型检查：JavaScript 是动态类型语言，而 TypeScript 提供了静态类型检查，帮助开发者在编译阶段发现类型错误。
	•	开发工具支持：由于 TypeScript 提供了类型信息，编辑器可以给出更准确的自动补全、错误提示和重构功能。
	•	类和接口：虽然 JavaScript 也支持类，但 TypeScript 增加了接口、访问控制符等面向对象的编程特性，使得代码更具结构化。

安装和设置

	1.	安装 TypeScript
首先确保你已经安装了 Node.js，然后使用 npm 安装 TypeScript：

npm install -g typescript


	2.	编写第一个 TypeScript 程序
创建一个 hello.ts 文件，写入以下内容：

let message: string = 'Hello, TypeScript!';
console.log(message);

运行以下命令将 TypeScript 编译为 JavaScript：

tsc hello.ts

这会生成一个 hello.js 文件，然后可以通过 Node.js 运行它：

node hello.js


	3.	TypeScript 配置文件 (tsconfig.json)
在项目根目录下创建 tsconfig.json，这是 TypeScript 编译器的配置文件，帮助定义编译选项。你可以通过 tsc --init 自动生成这个文件。

{
  "compilerOptions": {
    "target": "es6",
    "module": "commonjs",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true
  }
}



常见开发步骤

	1.	安装和初始化
安装 TypeScript 并初始化项目。创建 tsconfig.json 来配置 TypeScript 编译器的行为。
	2.	编写 TypeScript 代码
按照 TypeScript 的语法规则，编写具有类型注解的代码，使用类、接口、枚举等特性来提高代码的结构化和可维护性。
	3.	编译
使用 tsc 命令编译 TypeScript 文件，将其转换为 JavaScript，确保代码兼容性和性能。
	4.	调试和测试
借助 IDE 的类型提示和自动补全功能，优化代码，确保类型安全。利用 TypeScript 的类型检查，防止运行时错误。

通过学习这些核心概念，你将能快速上手 TypeScript，并在开发过程中体验到静态类型带来的优势。