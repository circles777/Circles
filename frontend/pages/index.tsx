import type { NextPage } from "next";
import { Box, Text, Image, Icon } from "@chakra-ui/react";
import { useWindowState } from "../utils/recoil/window";
import { motion } from "framer-motion";
import { navVariants } from "../utils/animation";
import { BsFillPersonFill } from "react-icons/bs";
import { AiOutlineSearch } from "react-icons/ai";

const Home: NextPage = () => {
  const { width: windowWidth, height: windowHeight } = useWindowState();
  return (
    <Box
      className={"main"}
      display={"flex"}
      flexDir={"column"}
      alignItems={"center"}
      justifyContent={"center"}
      position={"relative"}
      h={`${windowHeight}px`}
      w={`${windowWidth}px`}
    >
      {/*<Box
        display={"flex"}
        flexDir={"row"}
        alignItems={"center"}
        justifyContent={"space-between"}
        //bg={"silver"}
        //opacity={0.5}
        //background="linear-gradient(45deg, rgba(174, 105, 105, 1) 100%, rgba(66,153,225,1) 10%)"
        bgGradient={
          "linear(to-b, rgba(194, 194, 194, 1), rgba(194, 194, 194, 0.1))"
        }
        position={"fixed"}
        top={0}
        w={"100%"}
        p={"8px"}
      >
        <Text opacity={0.7} fontSize={"36px"}>
          Circles
        </Text>
        <Box
          display={"flex"}
          flexDir={"row"}
          gap={"8px"}
          alignItems={"center"}
        ></Box>
      </Box>*/}
      <Box
        display={"flex"}
        flexDir={"column"}
        alignItems={"center"}
        alignSelf={"flex-start"}
        borderRightColor={"silver"}
        borderWidth={"1px"}
        h={"100%"}
        position={"absolute"}
        justifyContent={"flex-end"}
        p={"16px"}
        bg={"rgba(144, 144, 144, 0.5)"}
        gap={"16px"}
        color={"white"}
      >
        <Text
          cursor={"pointer"}
          css={{ writingMode: "vertical-lr" }}
          _hover={{ opacity: 0.5 }}
        >
          Top
        </Text>
        <Text
          cursor={"pointer"}
          css={{ writingMode: "vertical-lr" }}
          _hover={{ opacity: 0.5 }}
        >
          About
        </Text>
        <Text
          cursor={"pointer"}
          css={{ writingMode: "vertical-lr" }}
          _hover={{ opacity: 0.5 }}
        >
          Contact
        </Text>
        <Icon
          as={AiOutlineSearch}
          cursor={"pointer"}
          boxSize={"24px"}
          _hover={{ opacity: 0.5 }}
        />
        <Icon
          as={BsFillPersonFill}
          cursor={"pointer"}
          boxSize={"24px"}
          _hover={{ opacity: 0.5 }}
        />
      </Box>
      <Image
        alt={"landing-image"}
        w={`${windowWidth}px`}
        h={"100%"}
        objectFit={"cover"}
        position={"absolute"}
        src={
          "https://res.cloudinary.com/dbfpsigax/image/upload/v1685804937/circles/close-up-happy-people-posing-together_fizy1z.jpg"
        }
        zIndex={-1}
      />
      <motion.div variants={navVariants} initial="hidden" whileInView={"show"}>
        <Text fontSize={"96px"}>Circles</Text>
      </motion.div>
    </Box>
  );
};

export default Home;
